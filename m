From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: ACL support.
Date: Wed, 26 Mar 2014 11:34:40 +0100
Message-ID: <5332AD40.1020308@gmail.com>
References: <5332645E.4070600@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=HLda8ix6WHhAB/pv+e3EOlJ8jiA4z7IfbNj3q8n4x+U=;
        b=NXykL2Q1TEilfQqylI2b9s2BLeCpGEwA21icBPgfeC1oYB9BPEEapChT7dJgB1Zw2a
         CQQhnKAoOc3S+TBSU5VvQ2QAYJPm25sykATDVp3dRd/6APGBeywl6mJEu1uM/RSEPuMZ
         i5Sh5932Fjrr7AcbKjIT3T6Dfbxjjj+jNIDRuVP8O9tX9xO57tVpO/v84KdB8cgywl7F
         zf6Ko3ADMVUfqExn5GTCj8W9OgaWl6kKLx/wPYa2IaYvkJmZ3bdqklnZWA57youJLRYK
         XGnIjye/GsGRI98c8kt9VdOZERCutPR8aSSFniXe09FJbXAmqdi1GWuukXNQEu0qfoM6
         C20Q==
In-Reply-To: <5332645E.4070600@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>, reiserfs-devel@vger.kernel.org

On 03/26/2014 06:23 AM, dE wrote:
> Does reiser4 support ACL?

Nope for historical reasons.
I'll provide hints how to implement this, if someone wants..

Edward.
