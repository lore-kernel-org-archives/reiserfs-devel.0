From: Hans Reiser <reiser@namesys.com>
Subject: Re: Interesting reading that I agree with;-)
Date: Thu, 23 May 2002 13:09:57 +0400
Message-ID: <3CECB1E5.6070104@namesys.com>
References: <3CEBAC2D.2030002@namesys.com> <20020522194204.GD458@turbolinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10409-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Andreas Dilger wrote:

>On May 22, 2002  18:33 +0400, Hans Reiser wrote:
>  
>
>>It is a pity we don't have more folks like Rob working on Linux.
>>    
>>
>
>I haven't read the whole paper, but at first glance it would appear
>to be trivial to do this under Linux, because the dentries maintain such
>an absolute path to a file.  The only thing that appears to be needed
>for this is the new syscall and the applications to actually use it.
>The syscall just needs to walk the dentry tree upwards to generate the
>full path, as is already done in the __d_path() function.
>
>Cheers, Andreas
>--
>Andreas Dilger
>http://www-mddsp.enel.ucalgary.ca/People/adilger/
>http://sourceforge.net/projects/ext2resize/
>
>
>
>  
>
I am told that Viro feels it would break applications.  I think the 
current .. handling should be considered a bug, and I don't really care 
what obscure applications are broken in return for fixing this commonly 
occuring bug.

Hans


