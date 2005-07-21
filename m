From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4progs do not handle the reiser4 format changes
Date: Thu, 21 Jul 2005 01:24:02 -0700
Message-ID: <42DF5BA2.3000605@namesys.com>
References: <42DE5A5E.9020404@namesys.com> <42DE9DD6.1090104@slaphack.com>	 <42DEF3C7.3040104@namesys.com> <e692861c0507210110777588d6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0507210110777588d6@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: Edward Shishkin <edward@namesys.com>, David Masover <ninja@slaphack.com>, "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com

Gregory Maxwell wrote:

>Nonselective use of this feature will be nearly useless. 
>
No, that is not true.  Most users are not interested in specifying per
file whether we can compress it.  So our plugin tries to compress the
first 64k, and if it fails to it assumes the file is not compressable. 
This is not always the correct thing, so being able to specify would be
nice, but it solves 80% of the problem, and that means we can deal with
the other 20% next year.

Hans
