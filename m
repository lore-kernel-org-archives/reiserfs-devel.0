From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: A file-based interface for mount
Date: Wed, 9 Jul 2003 21:08:57 +0400
Message-ID: <16140.19497.437113.157626@laputa.namesys.com>
References: <3F078EF1.6090908@mrs.umn.edu>
	<3F0C161B.6030707@namesys.com>
	<16140.7137.369855.682433@laputa.namesys.com>
	<3F0C4A63.8080808@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F0C4A63.8080808@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com

Grant Miner writes:
 > 
 > >
 > > Adding new mount is not hard. Removing a mount through editing ..mount
 > > is much harder, it's much easier to do something like
 > >
 > > echo "/dev/sda" > foo/..umount
 > >
 > > But what exactly is an advantage of this interface?
 > > If user is allowed to mount arbitrary file system at /some-place, it can
 > > mount something containing suid binary and here we go.
 > 
 > Right, you wouldn't want users to be able to get setuid and setgid files 
 > and device nodes.  (I'd like to see setuid and setgid go away, since 
 > proper ACLs are more secure and nicer.)  Perhaps we would have 3 ACLs 
 > inherited from the parent node, and these would act as booleans to 
 > control if we allow device nodes, setuid, and setgid files to exist in 
 > some directory.  By default, these would all be false so that users can 
 > safely mount their own filesystems without security hazards.
 > 
 > This brings me to another question: in Reiser 4 there will probably be a 
 > common usage where you have a file, which is a newline separated list.  
 > Will there be a plug-in, when you access that file as a directory, you 
 > get each line in its own file?
 > Example:
 > #cat file.txt
 > line 1
 > line 2
 > line 3
 > #cat file.txt/0
 > line 1
 > #cat file.txt/2
 > line 3

Currently such functionality is supported by some pseudo files
(http://www.namesys.com/v4/pseudo.html), but in ad hoc manner:

strelka:~ # cd /data1/sh/..pagecache
strelka:/data1/sh/..pagecache # cat . ; echo
121 0 0 0 121
strelka:/data1/sh/..pagecache # ls
.  ..  clean  dirty  io  locked  nrpages
strelka:/data1/sh/..pagecache # cat nrpages; echo
121

 > 
 > > Cool.  Probably not hard to write.  Can I get you to write it for 
 > > Reiser4?  If so, we can discuss details (I will be delayed for a week 
 > > in answering though due to traveling.) 
 > 
 > I have not written any kernel code before.  I could try it.
 > 

Everybody did it for the first time. :)

Nikita.
