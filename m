From: Anders Aagaard <aagaande@gmail.com>
Subject: Re: WARNING: Cannot unlink 2281245 (-2)
Date: Thu, 14 Aug 2008 11:04:10 +0200
Message-ID: <48A3F50A.4040401@gmail.com>
References: <48A3E64F.4090401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=QtYIb5hKhh49+BMwhiMMlCVziRdjfoZq2vrY2zArMpo=;
        b=Kpt/mpmSdx935EK9LQ3y8j2/IaFFxCbiEp9UwUquE0Tr3I+D2/jKsoNkwaAmY4VukQ
         HT6VvCzlCZXzTbc+gmZ361pgvvjPPhN9Sn3Q6HQo0b9MYwHXueoozsylchRz6HUwnFB4
         CDr6WNp+UAEaMDRqkcatTCCR4AiujOza7v+MY=
In-Reply-To: <48A3E64F.4090401@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Anders Aagaard wrote:
> PS : Computer survives memtest and prime overnight, smartd reports no 
> errors on the disk.

I've been doing some more testing, and I got a gut feeling something's.. 
off.  Take this with a grain of salt until I can do some more testing.

Changed bios lately to fix some suspend/resume annoyances, the computer 
was rock solid before that, but I got a feeling it's not rock solid when 
not under 100% load now.  Could be related to vdroop or something in the 
new bios revision, not quite sure, either way it needs more testing.

Gonna flash back to the previus bios and do all tests again from scratch.

