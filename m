From: Alex Adriaanse <alex.adriaanse@gmail.com>
Subject: Re: Odd data corruption problem with LVM/ReiserFS
Date: Tue, 22 Feb 2005 14:46:44 -0600
Message-ID: <93ca306705022212461f9e0d81@mail.gmail.com>
References: <93ca3067050220212518d94666@mail.gmail.com>
	 <4219C811.5070906@domdv.de> <20050222190149.GB9590@schmorp.de>
	 <421B8A69.8000903@domdv.de> <20050222194900.GB10968@schmorp.de>
Reply-To: Alex Adriaanse <alex.adriaanse@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050222194900.GB10968@schmorp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Marc A. Lehmann" <pcg@goof.com>, Andreas Steinmetz <ast@domdv.de>, Alex Adriaanse <alex.adriaanse@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tue, 22 Feb 2005 20:49:00 +0100, Marc A. Lehmann <pcg@goof.com> wrote:
> > >A reboot fixes this for both ext3 and reiserfs (i.e. the error is gone).
> > >
> >
> > Well, it didn't fix it for me. The fs was trashed for good. The major
> > question for me is now usability of md/dm for any purpose with 2.6.x.
> > For me this is a showstopper for any kind of 2.6 production use.
> 
> Well, I do use reiserfs->aes-loop->lvm/dm->md5/raid5, and it never failed
> for me, except once, and the error is likely to be outside reiserfs, and
> possibly outside lvm.

Marc, what about you, were you using dm-snapshot when you experienced
temporary corruption?

Alex
