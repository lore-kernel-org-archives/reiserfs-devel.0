From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: 3 corruptions found which can only be corrected via --rebuild-tree...
Date: Thu, 18 Jul 2002 11:34:01 -0400
Message-ID: <200207181134.01409.kuba@mareimbrium.org>
References: <20020718152035.GA779@caos.mine.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11053-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020718152035.GA779@caos.mine.nu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Moritz Angermann <cone@caos.mine.nu>
Cc: reiserfs-list@namesys.com

On czwartek 18 lipiec 2002 11:20 am, Moritz Angermann wrote:
> ... so or a lil' bit different was
> the line reiserfsck told me.
> so can anyone give me a hand a
> reach me a step-by-step tutorial how
> to reiserfsck a root partition ?
> ( how to create a rescue disk i.e. - w/e is needed)

easiest way?

dd your partition to an empty one
boot to the copy
repair the main root
boot to the repaired root

I usually keep root small (3gigs or so), so it's quite doable then.

Kuba
