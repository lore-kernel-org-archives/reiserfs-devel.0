From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 13:34:36 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <855536742.20040827133436@tnonline.net>
References: <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk>
 <20040826001152.GB23423@mail.shareable.org>
 <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk>
 <20040826010049.GA24731@mail.shareable.org>
 <20040826100530.GA20805@taniwha.stupidest.org>
 <20040826110258.GC30449@mail.shareable.org> <412E06B2.7060106@pobox.com>
 <1093552705.5678.96.camel@krustophenia.net>
 <1093553429.13881.48.camel@leto.cs.pocnet.net>
 <1093553846.5678.102.camel@krustophenia.net> <20040827092131.GA1284@nysv.org>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040827092131.GA1284@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-15?B?TWFya3VzIFT2cm5xdmlzdA==?=  <mjt@nysv.org>
Cc: Lee Revell <rlrevell@joe-job.com>, Christophe Saout <christophe@saout.de>, Will Dyson <will_dyson@pobox.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hello Markus,

Friday, August 27, 2004, 11:21:31 AM, you wrote:

> On Thu, Aug 26, 2004 at 04:57:26PM -0400, Lee Revell wrote:
>>On Thu, 2004-08-26 at 16:50, Christophe Saout wrote:
>>> are read-only and system-wide and the user-overridden changes. I don't
>>> know if all of these things would really make sense inside the kernel.
>>True.  FWIW, I never use most of those features.  It's just too damn
>>slow.  Windows seems to implement all of the useful features of
>>GnomeVFS, and they are 10x faster.

> Are they in the kernel in Windows?

  Some are, some aren't :)

  Many  of the features are between the FS and the application layers.
  Therefore  they will work with all programs that use the Windows API
  to  access  files  etc.  I  do not think that many programs actually
  access   disks  directly  at the FS or below level. Exceptions would
  perhaps be file-recovery tools etc.

  Others are simply plugins to Windows Explorer.

  I  don't  know  if  all,  any,  or none, are installed at the kernel
  level. I doubt they are.

  But  the  problem  with  Linux  seem to be that programs actually do
  access  the  FS  directly.  Therefore  everything  will break if you
  change the FS structures to much.

  Like I said, this is IMHO something that Linux should somehow solve.
  Applications  should  really  not  access  the filesystems directly.
  Perhaps Grub and stuff like it should, but not many other.

  ~S


