From: "Michal Piotrowski" <michal.k.k.piotrowski@gmail.com>
Subject: Re: reproducible hang with reiserfs and bash_shared_mapping
Date: Thu, 21 Jun 2007 17:44:43 +0200
Message-ID: <6bffcb0e0706210844k6f83a0f8n4ee60d98344e7bd8@mail.gmail.com>
References: <200706211226.03994.oliver@neukum.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=XKe4U0RmN+/eCGW8hEfXfVDB+EmsCdMtvgBtc77//+8+vD/oATSRT2E7dUWwIbhKibioDAFhlB1zIZzkTE2ranKoktS6GbLtJV9j6te98c+K+fNm5xD+rpa438IAmmQtP5SOcG/mw2EHGI0qXD6UYWtUb8qEuLNbk2Y40oHDgyA=
In-Reply-To: <200706211226.03994.oliver@neukum.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oliver Neukum <oliver@neukum.org>
Cc: reiserfs-dev@namesys.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Oliver,

On 21/06/07, Oliver Neukum <oliver@neukum.org> wrote:
> Hi,
>
> I get reproducible hangs when running bash_shared_mapping from the
> autotest suite. I've tested with a USB mass storage device and a PATA
> hard drive. No difference. Vanilla 2.6.22-rc5 and -git5 are affected. Ext3
> works flawlessly on both devices. Below is the result of sysrq-t while
> tasks are hanging.
>

Is this a regression?

Regards,
Michal

-- 
LOG
http://www.stardust.webpages.pl/log/
