From: Christian Jaeger <christian.jaeger@ethlife.ethz.ch>
Subject: Re: reiserfsck does not work on LVM snapshots
Date: Tue, 23 Mar 2004 14:42:12 +0100
Message-ID: <p04320400bc85eefe3117@[192.168.40.11]>
References: <200403231226.08522.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17409-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403231226.08522.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

At 12:26 Uhr +0300 23.03.2004, Vitaly Fertman wrote:
>why do you use --no-journal-available?

It is going to be ignored anyway.

>you need write permissions to replay the journal.

That's why I tried --no-journal-available :)

Christian.
