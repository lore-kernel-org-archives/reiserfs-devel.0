From: Dirk Steinberg <dws@steinbergnet.net>
Subject: Re: file as a directory
Date: Tue, 23 Nov 2004 10:11:21 +0100
Message-ID: <200411231011.21652.dws@steinbergnet.net>
References: <2c59f00304112205546349e88e@mail.gmail.com> <200411221759.iAMHx7QJ005491@turing-police.cc.vt.edu> <41A23566.6080903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S262349AbUKWJLc@vger.kernel.org>
In-Reply-To: <41A23566.6080903@namesys.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, Amit Gud <amitgud1@gmail.com>, linux-kernel@vger.kernel.org

On Monday 22 November 2004 19:52, Hans Reiser wrote:
> Valdis.Kletnieks@vt.edu wrote:
> >(Hint - "file as directory" broke a number of programs that didn't
> >expect that a file *could* be a directory, when run on a reiser4
> >filesystem...)
>
> It broke extraordinarily few.

I know from personal experience that it *does* break Acrobat Reader,
which, unfortunately, is binary-only and also a programm that I 
use quite often. For me this means I cannot use reiser4 (as root fs anyway)
without metas disabled.

How about making metas a mount option? Right now disabling metas 
requires patching the source.

/Dirk Steinberg
