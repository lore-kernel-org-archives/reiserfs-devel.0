From: Hans Reiser <reiser@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Sun, 08 Aug 2004 17:01:49 -0700
Message-ID: <4116BEED.8050804@namesys.com>
References: <20040808214432.E3E5715C90@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20076-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040808214432.E3E5715C90@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>, 'Nikita Danilov' <Nikita@namesys.com>, 'Alexander Zarochentcev' <zam@namesys.com>, "'E. Gryaznova'" <grev@namesys.com>

David Dabbs wrote:

>  
>
>>-----Original Message-----
>>From: Hans Reiser [mailto:reiser@namesys.com]
>>Sent: Monday, August 09, 2004 1:18 AM
>>To: David Dabbs
>>Cc: 'ReiserFS List'; 'Nikita Danilov'; 'Alexander Zarochentcev'; 'E.
>>Gryaznova'
>>Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
>>error"
>>
>>
>>    
>>
>
>...snip...
>
>  
>
>>Hans:
>>yes, it [hashing] is only a good idea for filenames larger than 15 
>>characters.
>>
>>    
>>
>
>Actually, larger than 7 + 8 + 8 characters, if LARGE_KEY is used.
>
Oh.  Ok.  LARGE_KEY is the only thing that should be used.

> This means
>that no keys were hashed in my tests, or the original mongo for that matter,
>since no file name would have been considered 'large' in kassign.c. I should
>up the file name limit slightly to exercise it with at least some hashed
>keys.
>
>  
>
>>it is extremely unrealistic to create the files in one phase and write
>>to them in the next phase.  the filesystem will behave completely
>>differently.
>>
>>    
>>
>
>Of course. The extra files I added are created once, and should never be
>touched again since mongo only operates on the objects it creates. I am
>simply loading the test filesystem with a reasonable facsimile of a 'normal'
>Linux file set (with the exception that the files are all zero length).
>
a huge exception.  I don't grok what you are trying to do here.

> To
>make these 'static' dirs/files really useful, mongo would need to be written
>to use these directories for its randomly created files. As for my files all
>being zero length, it would be easy to give them all some small file
>content. If these additional dirs/files as currently created add no value to
>the test, then do not enable these phases.
>
>On top of this Mongo randomly creates (in PHASE CREATE) its directories and
>files, with each file filled at creation with a random number of 'a'
>characters. Each subsequent phase, if specified, does one of the following
>operations in the order you see below. Since you said you hadn't looked at
>mongo for some time, I have included the commands mongo executes. These
>examples are from a run with three processes and three iterations, so each
>command below was run three times in succession. Note that mongo drives each
>phase from a file list, so the files are always manipulated in the same
>order - the order in which they were created.
>
>a) COPY command: Copy all files from some base iteration directory.
>(update-flist.pl /mnt/testfs/testdir0-0-0 /mnt/testfs/testdir1-0-0
>/var/tmp/mongo.flist0-0-0 /var/tmp/mongo.flist1-0-0  || touch ERR.file ) &
>(update-flist.pl /mnt/testfs/testdir0-0-1 /mnt/testfs/testdir1-0-1
>/var/tmp/mongo.flist0-0-1 /var/tmp/mongo.flist1-0-1  || touch ERR.file ) &
>(update-flist.pl /mnt/testfs/testdir0-0-2 /mnt/testfs/testdir1-0-2
>/var/tmp/mongo.flist0-0-2 /var/tmp/mongo.flist1-0-2  || touch ERR.file ) &
>wait; sync
>
>
>/*******************************************************************/
>update-flist.pl
>
>($DIR0, $DIR1, $FLIST0, $FLIST1) = @ARGV;
>
>system("cp -r $DIR0 $DIR1");
>
>open(FL0, $FLIST0) || DIE("Cannot open $FLIST0");
>open(FL1, ">$FLIST1") || DIE("Cannot open $FLIST1");
>while (<FL0>) {
>    s|^$DIR0|$DIR1|;
>    print FL1 $_;
>}
>close(FL1);
>close(FL0);
>
>/*******************************************************************/
>
>b) APPEND command: 
>(cat /var/tmp/mongo.flist[01]-0-0 | grep -v -e /\$ | mongo_append 0.5 4096
>off  || touch ERR.file ) & 
>(cat /var/tmp/mongo.flist[01]-0-1 | grep -v -e /\$ | mongo_append 0.5 4096
>off  || touch ERR.file ) & 
>(cat /var/tmp/mongo.flist[01]-0-2 | grep -v -e /\$ | mongo_append 0.5 4096
>off  || touch ERR.file ) &  
>wait; sync
>
>/*******************************************************************/
>mongo_append.c
>
>    while (getline(&line_buffer, &line_buffer_size, stdin) != -1) {
>	int fd, written = 0;
>	char * lf_pos;
>
>        if ((lf_pos = index(line_buffer, '\n')) != NULL) *lf_pos = '\0'; 
>
>	if ( (fd = open(line_buffer,O_RDWR)) == -1) {
>		fprintf(stderr, "%s :", line_buffer);
>		perror("cannot open file");
>		continue;
>	}
>
>	append_size = append_factor * lseek(fd, 0, SEEK_END);
>
>	while (written < append_size) {
>	    int error;
>	    written += (error = write(fd, buffer,
>		( append_size - written < writesize ) ? append_size -
>written:writesize));
>	    if (error == -1) {
>		close(fd);
>		break;
>	    }
>	}
>	if (use_fsync) {
>		if (fsync(fd) < 0) {
>			fprintf(stderr, "%s : failed to fsync file\n",
>line_buffer);
>			exit(1);
>		}
>	}
>	close(fd);
>    }
>    free (buffer);
>    free (line_buffer);
>    return 0;  
>
>/*******************************************************************/
>
>
>c) MODIFY command: 
>(cat /var/tmp/mongo.flist[01]-0-0 | grep -v -e /\$ | mongo_modify 0.02 4096
>off || touch ERR.file ) & 
>(cat /var/tmp/mongo.flist[01]-0-1 | grep -v -e /\$ | mongo_modify 0.02 4096
>off || touch ERR.file ) & 
>(cat /var/tmp/mongo.flist[01]-0-2 | grep -v -e /\$ | mongo_modify 0.02 4096
>off || touch ERR.file ) &  
>wait; sync
>
>/*******************************************************************/
>mongo_modify.c
>
>    while (getline(&line_buffer, &line_buffer_size, stdin) != -1) {
>	int fd;
>	off_t fileend;
>        char * lf_pos;
>       
>        if ((lf_pos = index(line_buffer, '\n')) != NULL) *lf_pos = '\0';
>
>	if ( (fd = open(line_buffer,O_RDWR)) == -1) {
>	    perror("cannot open file");
>	    continue;
>	}
>	fileend = lseek(fd,0,SEEK_END);
>	
>	if (fileend == (off_t) - 1) {
>            perror("lseek failed");
>            close (fd);
>	    continue;
>	} 	
>	if (!fileend) {
>		/* nothing to modify */
>	    close (fd);
>	    continue;
>	} 
>	
>	{
>		off_t region_size = (double)fileend * modify_factor;
>		off_t write_pos = (double)(fileend - region_size) * rand() /
>(RAND_MAX + 1.0);
>		size_t bytes = 0;
>
>		if (lseek(fd, write_pos, SEEK_SET) == (off_t) - 1) {
>				perror("lseek failed");
>				close (fd);
>				continue; 
>		}
>
>		while (bytes < region_size) {
>			size_t write_count = region_size - bytes;
>
>			if (write_count > write_buffer_size) 
>				write_count = write_buffer_size;
>
>			write_count = write(fd, buffer, write_count);
>
>			if (write_count == 0) break;
>
>			if (write_count == -1) {
>				perror("write failed");
>				break;
>			}
>			
>			bytes += write_count;
>		}
>		
>	}
>	if (use_fsync) {
>		if (fsync(fd) < 0) {
>			fprintf(stderr, "%s : failed to fsync file\n",
>line_buffer);
>			exit(1);
>		}
>	}
>	close(fd);
>    }
>    free (buffer);
>    free (line_buffer);
>    return 0;  
>
>/*******************************************************************/
>
>
>d) OVERWRITE command: 
>( cat /var/tmp/mongo.flist[01]-0-0 | grep -v -e /\$ | mongo_modify 1 4096
>off || touch ERR.file ) & 
>( cat /var/tmp/mongo.flist[01]-0-1 | grep -v -e /\$ | mongo_modify 1 4096
>off || touch ERR.file ) & 
>( cat /var/tmp/mongo.flist[01]-0-2 | grep -v -e /\$ | mongo_modify 1 4096
>off || touch ERR.file ) &  
>wait; sync
>
>
>See mongo_modify.c above.
>
>/*******************************************************************/
>
>e) READ command: 
>(find /mnt/testfs/testdir[01]-1-0 -type f | mongo_read || touch ERR.file ) &
>(find /mnt/testfs/testdir[01]-1-1 -type f | mongo_read || touch ERR.file ) &
>(find /mnt/testfs/testdir[01]-1-2 -type f | mongo_read || touch ERR.file ) &
>wait; sync
>
>/*******************************************************************/
>mongo_read.c
>
>	/* Read all file names from the standard input */ 
>	while ((rd = getline(&file_name_buf, &file_name_buf_size, stdin)) !=
>-1) {   
>
>		/* remove the new line character. */
>		if (rd > 0 && file_name_buf[rd - 1] == '\n')
>			file_name_buf[rd - 1] = 0;
>
>		/* open the file */ 
>		fd = open (file_name_buf, O_RDONLY);
>		if (fd == -1) {
>			fprintf (stderr, "Open failed (%s)\n", strerror
>(errno));
>			return errno;
>		}
>
>		/* read the file */
>		while (1) {
>			rd = read (fd, read_buf, bufsize);
>			if (rd == -1) {
>				fprintf (stderr, "Read failed (%s)\n",
>strerror (errno));
>				return errno;
>			}
>			if (rd == 0)
>				break; /* EOF */
>
>			/* file consists of 'a'. Check that */
>			if (char_to_check) {
>				int j;
>				for (j = 0; j < rd; j ++)
>					if (read_buf[j] != char_to_check) {
>						fprintf (stderr, "Incorrect
>data were read\n");
>						return EIO;
>				}
>			}
>		}
>		close (fd);
>	}
>
>	if (file_name_buf)
>		free(file_name_buf);
>	free (read_buf);
>	snapstats();
>	return 0;
>
>/*******************************************************************/
>
>f) STATS command: 
>((cat /var/tmp/mongo.flist[01]-0-0 | xargs ls -d) > /dev/null || touch
>ERR.file ) &
>((cat /var/tmp/mongo.flist[01]-0-1 | xargs ls -d) > /dev/null || touch
>ERR.file ) &
>((cat /var/tmp/mongo.flist[01]-0-2 | xargs ls -d) > /dev/null || touch
>ERR.file ) &
>wait; sync
>
>
>g) DELETE command:
>( rm -r /mnt/testfs/testdir[01]-0-0 || touch ERR.file ) &
>( rm -r /mnt/testfs/testdir[01]-0-1 || touch ERR.file ) &
>( rm -r /mnt/testfs/testdir[01]-0-2 || touch ERR.file ) &
>wait; sync
>
>
>Finally, if specified, it executes the large file phases
>
>h) dd_writing_largefile command: 
>( dd if=/dev/zero of=/mnt/testfs/largefile  bs=1M count=768 ) &
>( dd if=/dev/zero of=/mnt/testfs/largefile  bs=1M count=768 ) &
>( dd if=/dev/zero of=/mnt/testfs/largefile  bs=1M count=768 ) &  
>wait; sync
>
>i) dd_reading_largefile command: 
>( dd of=/dev/null if=/mnt/testfs/largefile  bs=1M count=768 ) &
>( dd of=/dev/null if=/mnt/testfs/largefile  bs=1M count=768 ) &
>( dd of=/dev/null if=/mnt/testfs/largefile  bs=1M count=768 ) &
>wait; sync
>
>
>
>
>
>  
>

