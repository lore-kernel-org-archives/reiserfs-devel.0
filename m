From: Mathieu Belanger <m@thieu.so>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 15:55:19 +0000
Message-ID: <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset=; format=flowed; DelSp=Yes; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Gentile <cnjgentile@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Du?an ?oli? <dusanc@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


I have updated 3.12-rc1 in git. It compile and should work.

Note that the shrinker API is gone so the code need to be adapted.

Until that, I reverted the kill shrinker API patch to make it work.
