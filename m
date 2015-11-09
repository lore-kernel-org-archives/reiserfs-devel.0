From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Mon, 9 Nov 2015 12:40:37 +0100
Message-ID: <56408635.8070905@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
 <561B7857.1030000@gmail.com> <1444817147.5346.10.camel@gmail.com>
 <1444820148.4077.1.camel@gmail.com> <1444849590.13210.3.camel@gmail.com>
 <561FE051.3000104@gmail.com> <1446660569.17425.1.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=9rx3wiuqFztM69N8RD69Ki9Vne3+l/VB2gQkMspQ2x0=;
        b=ETDFNf/gRWksNkMZt1TERd4s5V68vIxbl3sSd9Ise6hrS7c20m/zXQZV1YPWHTEAm4
         dIz4OV7VHVRG/YoSlH3Up7L1as9sjrFsQ0c1aIbw9oJnlzVL0Fo//4piZtsea9pK+TNB
         2fw0u8J0KWC32XFqI8IJ6GbFqZLKjHJC0YkqUIyRm/6/2hRJXFfMDC0Lhg0A+aHDDKpo
         lpFrVriUzIXoWkz1LCA5HTYW9vrOwFB9Kk5w627ckz3rTBwnYJzLT3pLiuAkMBasHkh8
         8bJb/o7l/mPYN7MngT9CqME6qlx+UQ4sRSjJg7HmmotF2rWdSGfX0PP7+v7DF1qO+HwD
         lEzA==
In-Reply-To: <1446660569.17425.1.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org



On 11/04/2015 07:09 PM, Ivan Shapovalov wrote:
> On 2015-10-15 at 19:20 +0200, Edward Shishkin wrote:
>> Hello,
>>
>> So the tail conversion is the culprit?
>> It's quite realistic...
>> I am currently on vacations,
>> I'll take a look at this at the end of October
>> more carefully.
>>
>> Thanks!
>> Edward.
> Hi Edward,
>
> what's the status of this? Do you have a bit of time to spend looking
> at the fixes? :)


Hi Ivan,

Sorry, I was on a business trip in China where Google is prohibited
with all its services (including gmail), so I wasn't able to receive emails.

Edward.
