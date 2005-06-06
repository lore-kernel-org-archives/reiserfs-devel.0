From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: Do a bad block check on a lvm with reiserfs
Date: Mon, 06 Jun 2005 23:14:39 +0400
Message-ID: <42A4A09F.20207@namesys.com>
References: <42A070FC.2080304@mh.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24324-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42A070FC.2080304@mh.be>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Barremaecker <info@mh.be>
Cc: reiserfs-list@namesys.com

Hello.

Would you please send me the output of
# lvdisplay --maps
# pvdisplay --maps

Thanks,
Lena

Matthias Barremaecker wrote:

> Hi,
>
> If I check my lvm partition, then I have bad blocks.
>
> To know what hd there's bad, I have to check the hd's seperatly.
>
> but what do i check and do I use the reiserfs block size (4096bytes) ?
>
> do I use /dev/hda or /dev/hda1 ?
>
> thanx.
>
> kind regardes,
>
> Matthias.
>
>
>


