From: Bryan Henderson <hbryan@us.ibm.com>
Subject: Re: FIFO files
Date: Wed, 18 Jun 2003 08:34:17 -0700
Message-ID: <OFBDB76739.EEEB11B5-ON87256D49.005440F0-88256D49.00557BBC@us.ibm.com>
References: <3EF04F96.7030406@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF04F96.7030406@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Cyrille Chepelov <cyrille@chepelov.org>, Oleg Drokin <green@namesys.com>, linux-fsdevel@vger.kernel.org, Hans Reiser <reiser@namesys.com>, Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com





>> XFS uses an ioctl to punch holes, dm_punch_hole, but it's prototype is
>> specific to XDSM.
>
>make_hole or zap_range would be alternative names.

The concept is a good one, and a separate system call, defined in a
filesystem-type-independent way, is better than an ioctl or fcntl, but the
interface should not be defined in terms of making holes.  At the highest
level, a file is just a stream of bytes.  A continuous stream.  So what
this interface should be seen as, and named as, is something that simply
clears a region of the file to zeroes.  In a particular implementation, if
it makes sense, this can be implemented by deallocating blocks that back
that region of the file.

Note that in some filesystem types, there may not be any concept of
allocated blocks or sparse vs dense files.

AIX has a system call for this and it is called fclear().  I like that
better than any alternative I've seen.

Bryan Henderson                         IBM Almaden Research Center
San Jose CA                             Filesystems

