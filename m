From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Corruption with Gentoo's PORTAGE_TMPDIR
Date: Tue, 03 May 2011 15:53:28 +0200
Message-ID: <4DC008D8.7080509@gmail.com>
References: <4DBD80CF.9070903@gmail.com>	<4DBDC6EE.1060402@gmail.com>	<4DBE4DB5.5050606@gmail.com> <BANLkTi=Pf45yL6dYoHxxgz-bH8hzBg8SGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=Pf45yL6dYoHxxgz-bH8hzBg8SGQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Serkan Kaba <serkan@gentoo.org>
Cc: reiserfs-devel@vger.kernel.org, dE <de.techno@gmail.com>

On 05/02/2011 09:07 AM, Serkan Kaba wrote:
> 2011/5/2 dE<de.techno@gmail.com>:
>> No, I don't have compression enabled. I formated the Gentoo partition using
>> fibration=lexic_fibre,formatting=extents, adding create=ccreg40 cleared the
>> issue.
> So let's get the issue solved in uncompressed partitions as well.

Sure. As I have already told I have found some problems in
(default) file plugin. I'll fix it up at my spare time.

  By
> the way, is there a way to compress a reiser4 partition without
> reformatting it?

Alas. It was conceived as a repacker option, which is only in plans..

Thanks,
Edward.
