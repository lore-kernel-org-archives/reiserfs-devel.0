From: Oleg Drokin <green@namesys.com>
Subject: Re: Stat Input/Output Error
Date: Wed, 21 Aug 2002 10:48:29 +0400
Message-ID: <20020821104829.A12004@namesys.com>
References: <MSGID_2=3a263=2f950_6a23273e@fidonet.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <MSGID_2=3a263=2f950_6a23273e@fidonet.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Rima <fido@tcob1.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Aug 21, 2002 at 07:06:56AM +0000, Sean Rima wrote:

> I am getting a couple of Input/Output errors on files and cannot remove the files. In fact if I touch them, my pc freezes.
> 
> It is a Linux 2.2.20 with reiserfs compiled, the HD is reiser. Is there anyway to use reiserfsck to sort these errors. The files lay on the root
> / hd

You need to obtain latest reiserfsprogs (3.6.3), create rescue boot disk of some
sort with reiserfsck from this reiserfsprgs version, boot off this rescue
disk and use reiserfsck to identify errors you have, and then fix the errors
by running reiserfsck with suggested options.
If you want to be on safe side, you may just run
reiserfsck -l /somewhere/logfile /dev/your_root_partition
and send us the logfile generated, and we will suggest you what to do next.

Bye,
    Oleg
