From: Grzegorz Kulewski <kangur@polcom.net>
Subject: Re: ReiserFS slow, need help diagnosing
Date: Mon, 5 Jun 2006 17:34:30 +0200 (CEST)
Message-ID: <Pine.LNX.4.63.0606051732110.25988@alpha.polcom.net>
References: <e61aht$7kf$1@sea.gmane.org>  <1149516737.6402.120.camel@tribesman.namesys.com>
  <e61f4n$p6b$1@sea.gmane.org> <1149520582.6402.134.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1149520582.6402.134.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Juergen Starek <quiterigorouslyfilteredusenetaccount@gmx.de>, reiserfs-list@namesys.com

On Mon, 5 Jun 2006, Vladimir V. Saveliev wrote:
> reiserfs does not store inodes as compact as ext3. It allocates inodes
> dynamically. As result reiserfs inodes get spread over whole filesystem.
> Also reiserfs tries to store file bodies in the same block as file's
> inode. As result one reiserfs block usually contains inodes than ext[23]
> inode block does.
> So, to stat each file of directory reiserfs has to perform more disk
> reads and to do more disk head seek than a filesystem which stores
> inodes compactly in preallocated disk area.

Is this performance problem with stat heavy load fixed in Reiser4?


Thanks,

Grzegorz Kulewski

