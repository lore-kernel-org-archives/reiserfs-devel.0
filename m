From: Hans Reiser <reiser@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Sun, 08 Aug 2004 11:08:40 -0700
Message-ID: <41166C28.6030402@namesys.com>
References: <20040808071141.BFDB615C8A@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20072-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040808071141.BFDB615C8A@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>, Nikita Danilov <Nikita@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, "E. Gryaznova" <grev@namesys.com>

David Dabbs wrote:

>  
>
>>-----Original Message-----
>>From: Hans Reiser [mailto:reiser@namesys.com]
>>Sent: Saturday, August 07, 2004 11:18 PM
>>To: David Dabbs
>>Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
>>error"
>>
>>    
>>
>
>  
>
>>How about, code was X, now it is Y, with just the relevant parts of the
>>code cited?
>>    
>>
>
>Probably the most significant change to mongo sources is how it generates
>file names. Mongo.pl had a hard coded value of 6 for the "max_fname"
>parameter passed to reiser_fract_tree. I made this a parameter one can
>specify on the mongo command line. I passed it a value of 23.
>  
>
most filenames are small.  We have an optimization in reiser4 that 
assumes filenames are less than 15 characters, which most of them are.

Maybe you should use a list of real filenames as well as a list of real 
directory names.  You can reuse the filenames, so long as they are 
unique within a directory.

Hmm, it occurs to me that rather than using the 7 character filename 
prefix in the hash we should use first 4 letters and last 3 letters.

Nikita, zam, what do you think?

>In addition, reiser_fract_tree.c now generates file names (not directories)
>with extensions. Before, every file name generated had none. Here is the
>original and modified code.
>
>
>CODE WAS
>/* generate a unique filename */
>void get_name_by_number(num_t this_files_number, char * str, char type)
>{
>  double rnd;
>  char t[16];
>  /* We need to generate filenames of different lengths */
>  rnd=rand();
>  rnd=rnd/RAND_MAX*max_fname+1;
>  sprintf (t, "%%c%%0%ulu",(int) rnd );
>  sprintf (str, t, type, this_files_number);
>
>}
>
>NOW CODE IS
>
>/* generate a unique filename */
>void get_name_by_number(num_t this_files_number, char * str, char type)
>{
>  double rnd;
>  char t[16];
>  /* We need to generate filenames of different lengths */
>  rnd=rand();
>  rnd=rnd/RAND_MAX*max_fname+1;
>  if( type == 'f' ) 
>    sprintf (t, "%%c%%0%ulu.%c",(int) rnd, '`'+(char)rnd );
>  else
>    sprintf (t, "%%c%%0%ulu",(int) rnd );
>
>
>  sprintf (str, t, type, this_files_number);
>
>}
>
>Backtick is the character immediately preceding 'a', so passing a value for
>max_fname that generates a character greater than 'z' might generate an
>extension character that might be a shell metacharacter. Hence my earlier
>warning about using this parameter.
>
>Finally, I added two phases to mongo. MKDIRS and MKFILES. The first makes
>directories from a static list of directories cat-ted from a file. MKFILES
>does the same, except with files. The files are created by executing the
>following code taken directory from reiser_fract_tree:
>
>/* make a file of a specified size */
>void make_file(int size, char * fname)
>{ 
>  char string [1025] = {0};
>  char * str = string;
>  int fd = 0;
>  int error;
>  static num_t this_files_number = 1;
>
>  /* open the file, and deal with the various errors that can occur */
>
>  if ((fd = open(fname, g_flags, 0666)) == -1 ) {
>    if (errno == ENOSPC) {
>      if (!already_whined) {
>	printf("reiser-2021A: out of disk (or inodes) space, will keep
>trying\n");
>	already_whined = 1;	/* we continue other file creation in out of
>				   space conditions */
>      }
>      return;
>    }
>    /*  it is sometimes useful to be able to run this program more than once
>	inside the same directory, and that means skipping over filenames
>that
>	already exist.  Thus we ignore EEXIST, and pay attention to all
>	else. */
>    if ( errno == EEXIST) {	/* just skip existing file */
>      return;
>    }
>    perror ("open");
>    exit (errno);
>  }
>
>  /* close the file */
>  if (close(fd)) {
>    perror("close() failed");
>    exit(errno);
>  }
>}
>
>Since the above code simply opens and closes the file, every file created is
>zero length, and it creates _many_ zero-length files.
>
Why would you want that?

> Before, all files
>created during a mongo run had some content, though I'd need to go back and
>check the size distribution function to be sure. 
>
>
>Finally, there is the bit about mounting and unmounting. Mongo.pl first
>unmounts the target filesystem, then runs the proper mkfs command, mounted
>the filesystem, ran df to get the block usage, then unmounted the
>filesystem. To run each phase, mongo calls the function mongo_launcher,
>which mounted the filesystem, ran the command for N iterations, then
>unmounted the filesystem.
>
>I made the following changes, see http://dabbs.net/reiser4/mongopl.html for
>more context.
>
>In 
>
>init_fsys: 
>   don't unmount the filesystem after mkfs * df.
>
>mongo_launcher:
>   don't call &mount_fsys; at beginning and &umount_fsys; at end of each
>phase
>
>
>Only umount_fsys at end of function mongo.
>
>
>David
>
>
>
>
>  
>
ok.  Unmounting between phases was probably a bad idea, as it benchmarks 
unmounting.  It should be fixed.
