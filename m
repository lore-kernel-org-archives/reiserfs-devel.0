From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Compatibility of  current 2.4.19.pending patchset
 with old data-logging??
Date: Thu, 12 Sep 2002 02:24:05 +0200
Message-ID: <3D7FDEA5.7040806@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11429-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

Hi!

Originally I wanted to prepare a new kernel based on 2.4.20-pre6. That 
didn't work due to a gcc compiler failure I have to investigate on here 
right now. Very dubious, the script even told me to send a detailed bug 
report - definitely too much for tonight. A 2.4.19 compiles well with my 
old patchset.

Previously I followed the 2.4.19.pending patch directory 
@ftp.namesys.com (by downloading and particularily reading, but not 
applying since Chris stopped his data-logging series -- That was when 
patch "05" changed its name from "05-hash_on_empty_fs-1.diff" to 
"05-reiserfs_make_bad_inode.diff", on 02-08-13, and maybe I even used 
some older patches from the latest rc to keep the data-logging working). 
BTW, it's an irritating thing to change the patches' names. That adds 
just more confusion to namesys' release management that could be 
considered "non-official" to our list or is lacking more public relation 
output.

Now I'm completely confused with my private file-naming-convention, the 
newest reiserfs 2.4.19.pending directory and the following question:

  Is the current 2.4.19.pending compatible with data-logging any more???

When I see the discussion about the new block-allocator, the testing 
directory etc. I assume a definite "No." (Please, please, correct me, if 
I'm wrong...)

So, for the overnight change to pre-kernel 7, where are the new 
data-logging patches Hans even announced to lkml?

Thanks for your hints ;-)

Manuel

