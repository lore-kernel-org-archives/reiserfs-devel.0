From: Hans Reiser <reiser@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 07 Apr 2003 23:46:08 +0400
Message-ID: <3E91D580.5040301@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <200304031822.12677.phma@webjockey.net> <200304041401.h34E1Hli003929@turing-police.cc.vt.edu>	            <200304040930.29884.phma@webjockey.net> <200304041447.h34Eluli004869@turing-police.cc.vt.edu> <3E8DA3CF.711EE4C0@namesys.com> <3E8DB7E5.9080407@namesys.com> <3E8DBE93.8BAEAF29@namesys.com> <3E8DD2C6.2040106@namesys.com> <3E91C59B.3823865C@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13609-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E91C59B.3823865C@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shushkin <edward@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Edward Shushkin wrote:

>Hans Reiser wrote:
>  
>
>>Edward Shushkin wrote:
>>    
>>
>
>  
>
>>>On the
>>>other hand, on the last seminar we made a conclusion to check key validness in
>>>oredr to avoid a possible security hole when read() first looks for uptodate
>>>(decrypted!) pages in memory before reading encrypted data from disk..
>>>
>>>      
>>>
>>So how about making a key of 0 be a special case which gets you the file
>>in its encrypted form?
>>
>>    
>>
>
>Let's rather use special flags of reiser4_open() system call, or something
>
People don't want a reiser4_open() system call.  Nobody wants to rewrite 
an application like cp to be crypto aware.  You need to create a current 
working key, or find out what LSM does.

>else instead of new special keys. 
>So everyone want:
>1) To make cheap backup (without decryption/encryption been involved)
>   of ciphertext possible. 
>2) To make this	backup possible for everyone who has appropriate
>   permissions but doesn't have a secret key. 
>
>I think that read/write methods for crypto files may ignore page cache which
>contains decrypted data, if the appropriate reiser4-specific flag O_SDIRECT
>is present, so read() will copy the ciphertext to user right from leaf nodes,
>and write() will insert the ciphertext from user right to the balanced tree.
>Thus, perhaps (1) is possible, *BUT* don't forget that file is stored on disk
>as a set of compressed clusters, so all the data clustering issues which was
>invisible in kernel will go to user's hassle, so in order to backup file user
>will need to do something very unusual like the following:
>
>/* cheap backup routine (draft without key management) */
>
>int fd_src, fd_dst, i, bytes;
>off_t fsize, cluster_size;
>struct crypt_key * src_key, dst_key;
>struct stat * fstat;
>char * buf;
>
>/* open the file we want to backup */
>fd_src = reiser4_open(src_filename, O_RDONLY | O_SDIRECT, src_key);
>
>/* get src file attributes */
>fstat(fd_src, fstat); 
>
>fsize = fstat->st_size;
>cluster_size = fstat->st_cluster; /* reiser4 specific attribute */
>
>/* create a new crypto-file with the same cluster_size for backup */
>fd_dst = reiser4_open(dst_filename, O_CREAT | O_WRONLY | O_SDIRECT, dst_key, cluster_size);  
>
>buf = malloc(cluster_size);
>
>for (i = 0; i <= fsize/cluster_size; i++) {
>    bytes = read(fd_src, buf, cluster_size);
>    if (bytes == -1) {
>	perror("read failed");
>	exit();
>    }      	  
>    if (write(fd_dst, buf, bytes) != bytes){
>        perror("write failed");
>	exit();
>    }	
>    lseek(fd_dst, cluster_size - bytes, SEEK_CUR);
>}
>free(buf);
>close(fd_src);
>close(fd_dst);
>    	  
>Basically the usage of all file syscalls will be senseless for the
>files opened with O_SDIRECT flag (it can be applied only in some
>operations which are going per cluster), moreover it will be easy to
>corrupt this files if they are not readonly. So (1) is possible with
>additional kernel support and inflated user's hassle. 
> 
>The (2) remains to be impossible, since after the file was opened with 
>O_SDIRECT flag, its *decrypted* data can be mapped into memory by mmap()
>which looks to the page cache, so anyway cheap backup can be done only
>by secret/share key owner. 
>Suggestions?
>
>Edward.
>
>
>  
>


-- 
Hans


