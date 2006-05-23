From: "Michal Piotrowski" <michal.k.k.piotrowski@gmail.com>
Subject: Re: [PATCH] updated reiser4 - reduced cpu usage for writes by writing more than 4k at a time (has implications for generic write code and eventually for the IO layer)
Date: Tue, 23 May 2006 22:33:20 +0200
Message-ID: <6bffcb0e0605231333n612da806j9bd910cba65e3692@mail.gmail.com>
References: <44736D3E.8090808@namesys.com>
	 <b5d90b2a0605231326g5319fea8wb9efef34ee5f7ec6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932152AbWEWUdW@vger.kernel.org>
In-Reply-To: <b5d90b2a0605231326g5319fea8wb9efef34ee5f7ec6@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexey Polyakov <alexey.polyakov@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <Linux-Kernel@vger.kernel.org>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, Nate Diller <ndiller@namesys.com>

Hi Hans,

On 23/05/06, Alexey Polyakov <alexey.polyakov@gmail.com> wrote:
> Hi!
>
> I'm actively using Reiser4 on a production servers (and I know a lot
> of people that do that too).
> Could you please release the patch against the vanilla tree?
> I don't think there's a lot of people that will test -mm version,
> especially on production servers - -mm is a little bit too unstable.

Any chance to get this patch against 2.6.17-rc4-mm3?

Regards,
Michal

-- 
Michal K. K. Piotrowski
LTG - Linux Testers Group
(http://www.stardust.webpages.pl/ltg/wiki/)
