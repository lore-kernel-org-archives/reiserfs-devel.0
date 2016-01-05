From: Georgios Tsalikis <georgios@tsalikis.net>
Subject: Overriding with node41 doesn't work.
Date: Tue, 5 Jan 2016 15:18:02 +0200
Message-ID: <n6gg6h$7u6$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Or at least so it seems. Once i used node=node41 for checksums but the 
system showed node40. Now i did an fsck with override node=node41 trying 
to add the feature in a partition with node40. It reports node40 
afterwards. Any clues?

