From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Fwd: options in reiser4
Date: Sat, 24 Sep 2016 23:07:14 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.16.1609242305140.17634@trent.utfs.org>
References: <CAMRsyOdqkwPq_UGRVR0DyNrptrHtJmR2R-1ifGS-p+V+=GoOFQ@mail.gmail.com> <CAMRsyOdr43GheHUEUzhqHfEO_iie=ZD1i+BzRTfUwQUxVzLvaQ@mail.gmail.com> <57D4199C.5010307@gmail.com> <CAMRsyOdzjkjhthdaGtfOTcmUOrdvX78L+fH0KaHCaPwEpgw_+w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAMRsyOdzjkjhthdaGtfOTcmUOrdvX78L+fH0KaHCaPwEpgw_+w@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mettavihari D <tv.lists@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

On Sat, 10 Sep 2016, Mettavihari D wrote:
> > Badblocks are unsupported in Reiser4 (as well as resizing the volume).
> 
> Any reason that Badblocks in not supported ?

Probably for the same reason it's not supported for other filesystems as 
well:

 > Re: "badblocks" for XFS?
 > http://oss.sgi.com/archives/xfs/2002-05/msg01480.html

HTH,
Christian.
-- 
BOFH excuse #218:

The UPS doesn't have a battery backup.
