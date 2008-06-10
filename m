From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: =?UTF-8?B?4oCeVG9vIG1hbnkgaXRlcmF0aW9uc+KAnCBhbmQgZnNjay5yZWk=?=
 =?UTF-8?B?c2VyNCBmYWlsdXJl?=
Date: Wed, 11 Jun 2008 02:43:59 +0400
Message-ID: <484F03AF.5000606@gmail.com>
References: <17734422.post@talk.nabble.com> <484DA0A8.8010401@gmail.com> <484DB99D.5070009@podzimek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <484DB99D.5070009@podzimek.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrej Podzimek <andrej@podzimek.org>
Cc: reiserfs-devel@vger.kernel.org

Andrej Podzimek wrote:
>> Please, make sure that you are using the latest version of reiser4:
>> there was a bug which could cause data corruption:
>> http://marc.info/?l=reiserfs-devel&m=120914767218498&w=2
>
> I am using Vanilla 2.6.24.7 (with Reiser4 patchset, of course). Maybe
> I should upgrade to 2.6.25.x... The bug seems to be quite recent.
>
>> Would you please pack the metadata of your /home by
>> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>> and let me download the file meta.gz
>
> Yes, here it is: http://andrej.podzimek.org/meta.gz
>

Your fs looks consistent, just --build-fs produces false alarm.
I'll take a look..
