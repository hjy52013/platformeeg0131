function back = save2txt( file_Name,  matrix ) %�Ѿ���matrix�����txt�ļ���

fop = fopen( file_Name, 'wt' );
[M,N] = size(matrix);
for m = 1:M
    for n = 1:N
        fprintf( fop, '%s', mat2str( matrix(m,n) ) );
        %fprintf( fop, '%d',  matrix(m,n ) );
         %fprintf( fop, '%f',  matrix(m,n ) );
        fprintf(fop,'\t');
    end
    fprintf(fop, '\n' );
end

back = fclose( fop ) ;