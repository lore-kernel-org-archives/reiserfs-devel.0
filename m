From: David Niklas <Hgntkwis@vfemail.net>
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Date: Tue, 28 Jul 2020 22:34:40 -0400
Message-ID: <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=FmncsGltNbBm
        9DrnbETpoZufhhj5tXE7ZJm+sjYOeS8=; b=ZG+6AwQc6INJ7Yvl7GWEGEP4II9M
        fDCwnVelBLcnc4pGN2JabiybdrfNdyMwVFe3i43sw05IjTIpQ0vibjCv8hbjPhmp
        9Wg015n64hilK9h/df02sLQtriemcY1/ZUovJ9qN2Vmt4A0rvR3aJpysiirSz0ug
        yOUI21M8LE8jBPA=
In-Reply-To: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

I should add that in chasing down this bug I have tried all the IO
schedulers available (noop deadline and cfq). Cfq is the one I'm now
using to reproduce this.

Also, I don't know if it makes a difference, but when the system first
starts up it takes 20m to get from the login manager to having my web
browsers restart and get all their pages from online. It might be because
there is a lot of IO going on or it might be that there are several
stalls in the scheduling; just not bad enough to cause a hung task
problem like above.
