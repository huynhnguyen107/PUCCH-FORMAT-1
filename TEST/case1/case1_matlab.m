load('txOrgData.mat');   % variable: txOrgData

x = txOrgData(:);        % column vector
I = real(x);
Q = imag(x);

I_fix = round(I * 2^15);
Q_fix = round(Q * 2^15);
%set I, Q at 0 =1
I_fix(1)= 32767;
Q_fix(1)= 32767;
I_fix = min(max(I_fix, -32768), 32767);
Q_fix = min(max(Q_fix, -32768), 32767);

I_u16 = typecast(int16(I_fix), 'uint16');
Q_u16 = typecast(int16(Q_fix), 'uint16');

fid = fopen('I.mem','w');
for k = 1:length(I_u16)
    fprintf(fid, '%04x\n', I_u16(k));
end
fclose(fid);

fid = fopen('Q.mem','w');
for k = 1:length(Q_u16)
    fprintf(fid, '%04x\n', Q_u16(k));
end
fclose(fid);




load('uci.mat');
u = uci;

ack         = double(u.O_ack);
m0          = double(u.m_0);
fre_hop     = strcmp(char(u.intraSlotFrequencyHopping), 'enabled');
symbol      = double(u.nSymbs);
prb         = double(u.nPRBs);
second_prb  = double(u.secondhop_PRB);
prb_offset  = double(u.prbOffset);
first_sym   = double(u.firstSymbIdx);
srflag      = double(u.srFlag);
nid         = double(u.NID);
rnti        = double(u.RNTI);
slot_idx    = double(u.slotAlloc);

make_hex = @() ...
    [ ...
    repmat('0',1,36), ...  % 144 bits
    dec2hex(ack,4), ...
    repmat('0',1,16), ...  % 64 bits
    dec2hex(m0,4), ...
    dec2hex(fre_hop,2), ...
    dec2hex(symbol,2), ...
    dec2hex(prb,4), ...
    dec2hex(second_prb,4), ...
    dec2hex(prb_offset,4), ...
    dec2hex(first_sym,2), ...
    dec2hex(srflag,2), ...
    dec2hex(0,4), ...
    dec2hex(nid,4), ...
    repmat('0',1,20), ...  % 80 bits
    dec2hex(rnti,4), ...
    repmat('0',1,14), ...  % 56 bits
    dec2hex(slot_idx,2) ...
    ];

hex0 = lower(make_hex()); % from uci.mat
fid = fopen('uci_param.mem','w');
fprintf(fid, '%s\n', hex0);
fclose(fid);
