From: Oleg Drokin <green@namesys.com>
Subject: Re: compatibility of 2.4.20-pre2/.19.pending & data-logging ?
Date: Thu, 15 Aug 2002 08:56:59 +0400
Message-ID: <20020815085659.A4232@namesys.com>
References: <20020814184938.A12116@namesys.com> <3D5B1600.2020405@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D5B1600.2020405@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Thu, Aug 15, 2002 at 04:46:24AM +0200, Manuel Krause wrote:

> are the introduced patches in 2.4.20-pre2 and/or 2.4.19.pending 
> compatible with Chris' patches? I didn't give them or 2.4.20-pre2 a try, 
> so far.

The core code is still compatible with what's went into 2.4.20-pre2, but options
parser code have changed.
reiserfs_file_write() inplementation is not compatible with datalogging
patches.

> Am I right to better wait until Chris is back and updates his 
> data-logging stuff for the actual pre-kernel, namesys-patches and more - 
> wait for the outstanding merge?? Anyone having experiences yet?

You won't be able to use data-logging stuff with 2.4.20-pre2, until Cris will
make a merge.

Bye,
    Oleg
