From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions (solved!)
Date: Mon, 30 Jun 2003 09:31:57 +0400
Message-ID: <20030630053157.GA17466@namesys.com>
References: <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com> <3EFD7FF5.7020305@g-house.de> <20030628115343.GA21256@namesys.com> <3EFD8317.9000009@g-house.de> <3EFD86FC.6060307@g-house.de> <20030628121843.GA21209@namesys.com> <3EFDB9AC.9030601@g-house.de> <20030629085411.GA11564@namesys.com> <3EFF84C7.6090903@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14786-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFF84C7.6090903@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Mon, Jun 30, 2003 at 02:31:03AM +0200, Christian Kujau wrote:

> >Good. Can you stress it for some time just to be sure?
> i've done so, a kernel compile on a fresh reierfs finished with no 
> errors, and in such a compile *a lot* of files are created/read, i guess 
> the compile would horrible fail if there were corruptions in any of them.

Well, it seems you will only see corruptions when your workload does not fit the RAM.

> and yes, if i ever stumble again over such an odd issue, i know your 
> mail address :-[]

Sure, let us know if something goes wrong.

Bye,
    Oleg
