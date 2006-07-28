From: David Masover <ninja@slaphack.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed
 by kernelnewbies.org regarding reiser4 inclusion)
Date: Fri, 28 Jul 2006 10:48:34 -0500
Message-ID: <44CA31D2.70203@slaphack.com>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Cc: Jeff Garzik <jeff@garzik.org>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Linus Torvalds <torvalds@osdl.org>

Horst H. von Brand wrote:
> Jeff Garzik <jeff@garzik.org> wrote:
> 
> [...]
> 
>> It is then simple to follow that train of logic:  why not make it easy
>> to replace the directory algorithm [and associated metadata]?  or the
>> file data space management algorithms?  or even the inode handling?
>> why not allow customers to replace a stock algorithm with an exotic,
>> site-specific one?
> 
> IMVHO, such experiments should/must be done in userspace. And AFAICS, they
> can today.

inode handling?  Really?

But what's wrong with people doing such experiments outside the kernel? 
  AFAICS, "exotic, site-specific one" is not something that would be 
considered for inclusion.
