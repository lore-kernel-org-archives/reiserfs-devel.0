From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Odd data corruption problem with LVM/ReiserFS
Date: Tue, 22 Feb 2005 21:54:19 +0100
Message-ID: <20050222205419.GA12797@schmorp.de>
References: <93ca3067050220212518d94666@mail.gmail.com> <4219C811.5070906@domdv.de> <20050222190149.GB9590@schmorp.de> <421B8A69.8000903@domdv.de> <20050222194900.GB10968@schmorp.de> <93ca306705022212461f9e0d81@mail.gmail.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <93ca306705022212461f9e0d81@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Adriaanse <alex.adriaanse@gmail.com>
Cc: Andreas Steinmetz <ast@domdv.de>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tue, Feb 22, 2005 at 02:46:44PM -0600, Alex Adriaanse <alex.adriaanse@gmail.com> wrote:
> On Tue, 22 Feb 2005 20:49:00 +0100, Marc A. Lehmann <pcg@goof.com> wrote:
> > Well, I do use reiserfs->aes-loop->lvm/dm->md5/raid5, and it never failed
> > for me, except once, and the error is likely to be outside reiserfs, and
> > possibly outside lvm.
> 
> Marc, what about you, were you using dm-snapshot when you experienced
> temporary corruption?

No snapshots either.

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
