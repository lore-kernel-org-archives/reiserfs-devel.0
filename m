From: =?UTF-8?B?4oCg?= <god12@niksula.hut.fi>
Subject: fs-level crypto
Date: Mon, 20 Apr 2015 11:00:26 +0200
Message-ID: <5534C02A.10507@niksula.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi.

There's ext4 filesystem-level encryption support pushed for upcoming 4.1 kernel. As
far as I recall there's been talks about possibility of sharing some of that code to
implement similar feature for f2fs as well.

I wonder if it could be possible to reuse this code to get fs-level encryption for R4
too? Or maybe there's already crypto implementation which I've overlooked?

cheers,
Max.

