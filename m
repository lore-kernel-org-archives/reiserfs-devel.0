From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: [RFC] Sane defaults for tmgr.atom_max_size
Date: Sat, 24 Dec 2016 19:19:26 +0100
Message-ID: <CADW=+3=QyRKxCGmDjBnLNKF=NQTTq1XbM2DrNUAd7qYeN5N=Rg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JA4sPWzH3PzlkXbOUTfIwwJKuzKn+CJXpqT6WxUU8Ec=;
        b=ufk5jA0+MXyPOTqtNwXIzKtrd2qQ2yguqD66NYacqYM8ysU12rlmgrAdmZQDrrUztq
         NECxhZUWLnV/TIpV7phgBojD1MN0pZESYISJ2MkFtSPehGuP7l9cmPFGktuBRoB9A/BC
         EWNInQIHsQ4Z4rcuvk8l83F1PlSJWv2VbQwFVV0Px7zSw9hSvlratbfYOD3X+AL+5paO
         eyYdhI1LmZDL7zeu8Tbnevoc3JTUkR3u12A4PJRCJJaOSq+4YzzaX6i9PwjfHK2sOqBH
         A/oYD22aatwXH+dn49/4KOaGMGDVrqrOMDFRzMXenGWLVCqqepVG5womwSQA7rWKCf2/
         xNKQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Currently tmgr.atom_max_size defaults to 1/4 of RAM.
Historically RAM size increased faster than disk write speeds  so
machines today usually ship with 4-16GB of RAM that means that we can
get to situation where we have to flush 1-4GB of data and while doing
so system would be unresponsive for minutes for apps that wait on
sync.

If we presume an optimistic scenario of 100MB/s write speed and 10sec
wait time for 16GB RAM we come to the 1/16 ratio.

Your thoughts?

Dushan
