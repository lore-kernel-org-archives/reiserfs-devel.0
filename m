From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions (solved?)
Date: Sun, 29 Jun 2003 12:54:11 +0400
Message-ID: <20030629085411.GA11564@namesys.com>
References: <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com> <3EFD7FF5.7020305@g-house.de> <20030628115343.GA21256@namesys.com> <3EFD8317.9000009@g-house.de> <3EFD86FC.6060307@g-house.de> <20030628121843.GA21209@namesys.com> <3EFDB9AC.9030601@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFDB9AC.9030601@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Sat, Jun 28, 2003 at 05:52:12PM +0200, Christian Kujau wrote:

> 2.5.72 with your patch applied booted just fine and a freshly created 
> reiserfs on test.img brought no differences any more! Yes!

Good. Can you stress it for some time just to be sure?

> reiserfsck showed no corruptions, so the issue seems to be solved :-)

Good, if only I can be able to verify that myself...
I guess I need to try on Itanium, may be I will be more lucky with it.

> i'll provide a output of "debugreiserfs -d test.img" after a fresh 
> mkreiserfs on the very known address; tell me if you need any further 
> details.

No need for that. debugreiserfs output is sometimes useful when something goes
wrong.

Thanks for all the testing.

Bye,
    Oleg
