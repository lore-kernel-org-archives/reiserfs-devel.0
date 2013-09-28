From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Sat, 28 Sep 2013 13:43:00 -0400
Message-ID: <52471524.2050602@gmail.com>
References: <20130928162059.Horde.e5qchgOzKFDhZg1LolArqA2@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=WVaONTxiYvPqsfGMlS6pP5DzBzKGXyeoCOgwUGkmQ/4=;
        b=csnHX7gHbN+jd6LniZz2O0hu73+HJPwKTHPgQ/qFohfzE3V9cFtYNIoIYw30uh05nf
         uESDVuagc+Gjm31jXRAGVkso8PmWh/w/WMjOeVgp/Yf8IkEPOV9IisLZmYIwmN7EIVfD
         r0y4KfocAaO3I3q1HvyHN4RAX4JAIo6VZ90YySu0kmCClkFe6tbTtLiu+7JR5VpFXdeb
         zqcXK3RlzpcgqOdbxk8afaUiIPGnxABdJtAaWR6zva1DqRbolmxGrcXofM35J2uksUXZ
         o+ds55dVwAGipyec5YGFqisTJ/IfBNtxdUPvzUyTqGy10SRZfpT3ODKOw90k57swgOnU
         OX8w==
In-Reply-To: <20130928162059.Horde.e5qchgOzKFDhZg1LolArqA2@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m@thieu.so
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


I must be doing something wrong... get the same error if I download your
tree fresh or use the altered one I am running currently.

Please see here...

make mrproprer ....(tons of lines of text)....

Hyperthread reiser42 # git reset --hard
Checking out files: 100% (44769/44769), done.
HEAD is now at 7235ddc small fix for shrinker (oups)
Hyperthread reiser42 # git diff v3.12-rc2 reiser4-for-3.12-rc2 >
/tmp/reiser4-for-3.12-rc2
fatal: ambiguous argument 'v3.12-rc2': unknown revision or path not in
the working tree.
Use '--' to separate paths from revisions, like this:
'git <command> [<revision>...] -- [<file>...]'
Hyperthread reiser42 #




On 09/28/13 12:20, m@thieu.so wrote:
> git diff v3.12-rc2 reiser4-for-3.12-rc2 > /tmp/reiser4-for-3.12-rc2 

