function mfigure( index )
%activate a graph window. The index must be between 0 and 24.
%�O���t�E�B���h�E���N���B index��0~24�܂�
%ex:
% mfigure;
% mfigure(3);


m = mjo.core.MjoManager.getSharedInstance();

if(nargin == 0)
    m.launchFrame();
else
    m.launchFrame(index);
end

end