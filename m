From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: errors AFTER fsck
Date: Sat, 05 Apr 2008 13:38:24 +0400
Message-ID: <47F74890.3080005@gmail.com>
References: <200804041938.18418.volker.armin.hemmann@tu-clausthal.de> <47F68DAD.5010305@gmail.com> <200804042254.56672.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200804042254.56672.volker.armin.hemmann@tu-clausthal.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Cc: reiserfs-devel@vger.kernel.org

Volker Armin Hemmann wrote:

>Hi,
>
>one essential thing I forgot:
>
>last night I switched off my computer a little bit too fast, at boot I had 
>unclean fs. That could explain the initial corruption that portage complained 
>about.
>  
>

Normally this shouldn't lead to data corruption.
So I would ask everyone to pack metadata _before_
--build-fs, if the last one is required after hard reset.

The instructions are here:
http://marc.info/?l=reiserfs-devel&m=120734060926204&w=2

Thanks,
Edward.
 
