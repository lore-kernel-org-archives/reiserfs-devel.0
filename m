From: "Sean Rima" <fido@tcob1.net>
Subject: Re: Stat Input/Output Error
Date: Wednesday, 21 Aug 2002 14:47:48 +0000
Message-ID: <MSGID_2=3a263=2f950_63fdb346@fidonet.org>
References: <20020821104829.A12004@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11276-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020821104829.A12004@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Originally to: Oleg Drokin

-=> Oleg Drokin wrote to All <=-

 > I am getting a couple of Input/Output errors on files and cannot remove the
 OD> files. In fact if I touch them, my pc freezes.
 >
 > It is a Linux 2.2.20 with reiserfs compiled, the HD is reiser. Is there
 OD> anyway to use reiserfsck to sort these errors. The files lay on the
 OD> root
 > / hd

 OD> You need to obtain latest reiserfsprogs (3.6.3), create rescue boot
 OD> disk of some
 OD> sort with reiserfsck from this reiserfsprgs version, boot off this
 OD> rescue disk and use reiserfsck to identify errors you have, and then
 OD> fix the errors by running reiserfsck with suggested options.
 OD> If you want to be on safe side, you may just run
 OD> reiserfsck -l /somewhere/logfile /dev/your_root_partition
 OD> and send us the logfile generated, and we will suggest you what to do
 OD> next.

I will do this and if I get something that looks like I can handle it then I will do so, otherwise I will send a log to the list.

Thanks again.

Sean


... Confuse people: Quote from the wrong message!

<-> Gateway Information.
This message originated from a Fidonet System (http://www.fidonet.org)
and was gated at TCOB1 (http://www.tcob1.net)
Please do not respond direct to this message but via the list


