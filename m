From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: file as a directory
Date: Mon, 22 Nov 2004 19:24:50 +0100 (MET)
Message-ID: <Pine.LNX.4.53.0411221922570.27104@yvahk01.tjqt.qr>
References: <2c59f00304112205546349e88e@mail.gmail.com>
 <200411221759.iAMHx7QJ005491@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22506-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411221759.iAMHx7QJ005491@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>Go back and re-read the whole flame-fest, understand all the points
>raised, and let us know when you have a workable proposal.
>
>(Hint - "file as directory" broke a number of programs that didn't
>expect that a file *could* be a directory, when run on a reiser4
>filesystem...)

So let's keep it to reiser4 as to not wildly break programs running on other
filesystems used in "stable kernels". I'm saying that everybody who runs a R4
FS knows that apps might break, and thus is responsible for making them ready
for reiser4. (Or ask the prog's maintainer.)



Jan Engelhardt
-- 
Gesellschaft für Wissenschaftliche Datenverarbeitung
Am Fassberg, 37077 Göttingen, www.gwdg.de
