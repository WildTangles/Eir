function getmcml(name)% function getmcml(name)% 	reads the MCML output file <name> and returns the global values.% 	If PRINTON ==1 or PLOTON ==1, output is turned on.% USES%	makec2f.m which creates a colormap.% by Steven L. Jacques, Jan. 2008% Oregon Health & Sciences University, Portland, OR, USAglobal A Al Az Azr Fzr Fz Na Nc Nlayers global Nr Nz Rd Ra Rr Rra Rsp T Ta Td Tr Tra d dr dz global g mua mus n nabove nbelow r zglobal rm Azrm Fzrmglobal PLOTON PRINTONfid = fopen(name,'r');% PLOTON = 0; % 0 = off, 1 = on.  Controls plotting option.% PRINTON = 0;%%%% read dr, dz, Nz, Nr, Na, Nlayer%%%%for i=1:15; line = fgetl(fid); disp(line); endu = sscanf(line, '%f %f');dz = u(1);dr = u(2);line = fgetl(fid);u = sscanf(line, '%d %d %d');Nz = u(1);Nr = u(2);Na = u(3);line = fgetl(fid);line = fgetl(fid);Nlayers = sscanf(line, '%d');if PRINTON    disp(sprintf('dr = %0.4f',dr))    disp(sprintf('dz = %0.4f',dz))    disp(sprintf('Nr = %d',Nr))    disp(sprintf('Nz = %d',Nz))    disp(sprintf('Na = %d',Na))    disp(sprintf('Nlayer = %d', Nlayers))endline = fgetl(fid);line = fgetl(fid);nabove = sscanf(line, '%f');if PRINTON    disp(sprintf('nabove = %0.3f', nabove))endn = zeros(Nlayers,1); mua = n; mus = n; g = n; d = n;if PRINTON    disp(sprintf('\t#:\tn   \tmua  \tmus  \tg    \td'))endfor i=1:Nlayers	line = fgetl(fid);	u = sscanf(line, '%f %f %f %f %f');	n(i)   = u(1);	mua(i) = u(2);	mus(i) = u(3);	g(i)   = u(4);	d(i)   = u(5);	if PRINTON        disp(sprintf('\t%d:\t%0.2f\t%0.2f\t%0.1f\t%0.3f\t%0.4f', i, n(i), mua(i), mus(i), g(i), d(i) ))    endendline = fgetl(fid);nbelow = sscanf(line,'%f');if PRINTON    disp(sprintf('nbelow = %0.3f', nbelow))endline = fgetl(fid);%%%%% read RAT ---> Rsp, Rd, A, T%%%%line = fgetl(fid); if PRINTON    disp(line)endline = fgetl(fid);Rsp  = sscanf(line,'%f'); disp(sprintf('\tRsp = %f', Rsp))line = fgetl(fid);Rd    = sscanf(line,'%f'); disp(sprintf('\tRd = %f', Rd))line = fgetl(fid);A    = sscanf(line,'%f'); disp(sprintf('\tA = %f', A))line = fgetl(fid);Td   = sscanf(line,'%f'); disp(sprintf('\tT = %f', Td))%%%% Read A_l --> Al%%%%line = fgetl(fid);line = fgetl(fid); if PRINTON    disp(line)endfor i=1:Nlayers	line = fgetl(fid);	Al(i) = sscanf(line,'%f');	if PRINTON        disp(sprintf('\tAl(%d) = %f',i,  Rsp))    endend%%%% Read A_z --> Az%%%%line = fgetl(fid); line = fgetl(fid); if PRINTON    disp(line)endAz = fscanf(fid, '%f');%%%% read Rd_r ---> Rr[Nr]%%%%line = fgetl(fid); if PRINTON    disp(line)endRr = fscanf(fid,'%f');%fileID = fopen(strcat(name(1:end-4), 'Rr.txt'),'w');fprintf(fileID,'%f\n',Rr);fclose(fileID);disp(Rr)%clear D ans a b c2 h h2 i ii j line sz u v w w2 ifile