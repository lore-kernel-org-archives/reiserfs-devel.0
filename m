From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: file as a directory
Date: Wed, 24 Nov 2004 15:05:15 +0100 (MET)
Message-ID: <Pine.LNX.4.53.0411241501080.2693@yvahk01.tjqt.qr>
References: <2c59f00304112205546349e88e@mail.gmail.com>  <41A1FFFC.70507@hist.no>
 <41A21EAA.2090603@dbservice.com>  <41A23496.505@namesys.com>
 <1101287762.1267.41.camel@pear.st-and.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22548-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1101287762.1267.41.camel@pear.st-and.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>I think something like
>
>/etc/passwd/[username]
>
>would be a really nice extension. The idea is more general, it would
>unify the namespace for file selection and part-of-file selection.

Yeah, and where will you do that? (Possible answers are: kernel space, user
space).

I honestly vote against *these* kinds of plugins (i.e. reading .tar files,
/etc, and such). For one, it is to be done in kernel space, which means the
module code can not be swapped out. Debugging is more complex, segfaults will
kill the machine -- thus it's more open to blackhat hackers.

Also simply because it (the module code) would be a reinvention of wheel, it's
all been written before.




Jan Engelhardt
-- 
Gesellschaft für Wissenschaftliche Datenverarbeitung
Am Fassberg, 37077 Göttingen, www.gwdg.de
