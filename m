From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Mon, 19 Aug 2002 15:55:15 +0200
Message-ID: <20020819135515.GA24645@merlin.emma.line.org>
References: <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com> <20020819142035.A5741@namesys.com> <3D60C82F.1080403@namesys.com> <20020819144046.A6258@namesys.com> <3D60D304.3090508@namesys.com> <20020819152002.A6682@namesys.com> <3D60F2CC.7030806@namesys.com> <20020819173150.E7520@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020819173150.E7520@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, 19 Aug 2002, Oleg Drokin wrote:

> Hello!
> 
> On Mon, Aug 19, 2002 at 05:29:48PM +0400, Hans Reiser wrote:
> 
> > I want it to use /etc/badblocks file if it exists, and if it uses then 
> 
> /etc/badblocks for which volume, how about other mounted volumes?
> (appending volume name won't work, as these may easily move by itself, esp. on
> scsi)

And a UUID (not sure if reiserfs has one, ext2fs/ext3fs have) can again
fall prey to corruption, but would otherwise be invariant to moving the
partition around (be it pvmove, adding another SCSI drive, you name it).

