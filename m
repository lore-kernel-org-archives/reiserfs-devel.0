From: Jeremy Howard <jh_lists@fastmail.fm>
Subject: External journals and NVRAM devices
Date: Fri, 01 Nov 2002 16:38:32 +1100
Message-ID: <3DC21358.5040808@fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi all,

I'm looking at buying solid state drives / NVRAM drives for our servers
to hold an external ReiserFS journal.

We are using 2.4.20pre11, and Chris Mason's data logging patches.

I'm looking for any tips on how large the journal is when using
data=journal, and whether the external log patches are stable and work OK
in data=journal mode. Is there a command to show the current journal
size? Does the size vary over time? We need to ensure we buy a card with
enough memory so this is important information for us.

Is anyone currently using NVRAM for the journal? If so, how do you find
the performance of this configuration?

TIA,
   Jeremy


