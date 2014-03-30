function L = Shturm(F, a, b)
sequence{1} = F;
sequence{2} = polyder(F);
for i = 3:100
    [~, q] = deconv(sequence{i-2}, sequence{i-1});
    if (any(q))
        sequence{i} = -nonzeros(q)';
    else
        break;
    end
end
L = Chain(sequence, a, b);
end

function L = Chain(sequence, a, b)
N = Variation(sequence, a) - Variation(sequence, b);
if (N == 0)
    L = zeros(0);
    return
elseif (N == 1)
    L = [a b];
elseif (N > 1)
    center = (a + b) / 2;
    L = vertcat(Chain(sequence, a, center), Chain(sequence, center, b));
end
end

function V = Variation(sequence, a)
signs = nonzeros(cellfun(@(x) sign(polyval(x, a)), sequence));
previous_sign = signs(1);
V = int32(0);
for i=1:length(signs)
    current_sign = signs(i);
    if previous_sign ~= current_sign
        previous_sign = signs(i);
        V = V + 1;
    end
end
end