function [ang1] = mapAngles(ang)

    ang1 = ang;
    for i = 1:size(ang, 1)
        for j = 1:size(ang, 2)
            angle = ang(i,j);

            if abs(angle) < 22.5
                ang1(i,j) = 0;
            elseif abs(angle) < 67.5
                if angle > 0
                    ang1(i,j) = 45;
                else
                    ang1(i,j) = 135;
                end
            elseif abs(angle) < 112.5
                ang1(i,j) = 90;
            elseif abs(angle) < 157.5
                if angle > 0
                    ang1(i,j) = 135;
                else
                    ang1(i,j) = 45;
                end
            else
                ang1(i,j) = 0;
            end
        end
    end
end