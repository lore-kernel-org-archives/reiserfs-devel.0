From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions (solved?)
Date: Sat, 28 Jun 2003 17:52:12 +0200
Message-ID: <3EFDB9AC.9030601@g-house.de>
References: <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com> <3EFD7FF5.7020305@g-house.de> <20030628115343.GA21256@namesys.com> <3EFD8317.9000009@g-house.de> <3EFD86FC.6060307@g-house.de> <20030628121843.GA21209@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030628121843.GA21209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi Oleg,

2.5.72 with your patch applied booted just fine and a freshly created 
reiserfs on test.img brought no differences any more! Yes!

reiserfsck showed no corruptions, so the issue seems to be solved :-)

i'll provide a output of "debugreiserfs -d test.img" after a fresh 
mkreiserfs on the very known address; tell me if you need any further 
details.

happy,
Christian.

