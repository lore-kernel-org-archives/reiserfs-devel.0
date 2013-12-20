From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.12
Date: Fri, 20 Dec 2013 20:00:58 +0100
Message-ID: <52B493EA.9070804@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=sMgBBVChWMbN5IoSocDJJw6q4+eUNlWGcrQF59Dee5k=;
        b=zXTtLfwWh31tiIrWsW2+p10NkLTLzOAkwuq3BikT7rUY9k0tyBwot/fyZmm0UObjv/
         KaSHNyAPkWVaEadHeuEjGuBrRbxWhwhnPEbIVk5o1oF9v7IppQ0BjNIDXtX9NIEEJX+T
         bSVRn/1unQTlFyrocfIZ9bY6276SMXtFGTuguhAwr8fvx4p7lFaOm/vrCHB0JCr6eSnq
         KozgP+0o8jUWVPTuNc02++oe1aOvvkrZ+17vZAWxYe+ILOFoCo2zq6U231h/8p+N/VrI
         4Y7SQUQo6/f8kwNY5eU9OzUvX6LrH1xb9yrVhvgkon06/7Rss8XFwvLl2MeglswaNprR
         dOpg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Mathieu Belanger

. Adjust to new shrinker API

Ivan Shapovalov

. Add module alias for 'reiser4' filesystem
. Support user namespaces and kuid_t/kgid_t.

Edward Shishkin

. Remove not used readahead stuff from struct fsdata

Please, find here: 
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/

Thanks,
Edward.

