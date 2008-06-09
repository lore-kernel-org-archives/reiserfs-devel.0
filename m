From: Andrej Podzimek <andrej@podzimek.org>
Subject: Re: =?UTF-8?B?4oCeVG9vIG1hbnkgaXRlcmF0aW9uc+KAnCBhbmQgZnNjay5yZWk=?=
 =?UTF-8?B?c2VyNCBmYWlsdXJl?=
Date: Tue, 10 Jun 2008 01:15:41 +0200
Message-ID: <484DB99D.5070009@podzimek.org>
References: <17734422.post@talk.nabble.com> <484DA0A8.8010401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <484DA0A8.8010401@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

> Please, make sure that you are using the latest version of reiser4:
> there was a bug which could cause data corruption:
> http://marc.info/?l=reiserfs-devel&m=120914767218498&w=2

I am using Vanilla 2.6.24.7 (with Reiser4 patchset, of course). Maybe I should upgrade to 2.6.25.x... The bug seems to be quite recent.

> Would you please pack the metadata of your /home by
> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
> and let me download the file meta.gz

Yes, here it is: http://andrej.podzimek.org/meta.gz

Regards,

Andrej



