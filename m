From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: A file-based interface for mount
Date: Wed, 09 Jul 2003 12:01:23 -0500
Message-ID: <3F0C4A63.8080808@mrs.umn.edu>
References: <3F078EF1.6090908@mrs.umn.edu>	<3F0C161B.6030707@namesys.com> <16140.7137.369855.682433@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14847-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16140.7137.369855.682433@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com


>
> Adding new mount is not hard. Removing a mount through editing ..mount
> is much harder, it's much easier to do something like
>
> echo "/dev/sda" > foo/..umount
>
> But what exactly is an advantage of this interface?
> If user is allowed to mount arbitrary file system at /some-place, it can
> mount something containing suid binary and here we go.

Right, you wouldn't want users to be able to get setuid and setgid files 
and device nodes.  (I'd like to see setuid and setgid go away, since 
proper ACLs are more secure and nicer.)  Perhaps we would have 3 ACLs 
inherited from the parent node, and these would act as booleans to 
control if we allow device nodes, setuid, and setgid files to exist in 
some directory.  By default, these would all be false so that users can 
safely mount their own filesystems without security hazards.

This brings me to another question: in Reiser 4 there will probably be a 
common usage where you have a file, which is a newline separated list.  
Will there be a plug-in, when you access that file as a directory, you 
get each line in its own file?
Example:
#cat file.txt
line 1
line 2
line 3
#cat file.txt/0
line 1
#cat file.txt/2
line 3

> Cool.  Probably not hard to write.  Can I get you to write it for 
> Reiser4?  If so, we can discuss details (I will be delayed for a week 
> in answering though due to traveling.) 

I have not written any kernel code before.  I could try it.

