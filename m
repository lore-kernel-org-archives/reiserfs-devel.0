From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Reiserfs.c bug in 3.2-rc5
Date: Tue, 3 Jan 2012 08:48:58 -0800
Message-ID: <CA+55aFzwq6XiAnX26uV+-mNsbGbnj0S=4nP5avPqKPw8OT+cmw@mail.gmail.com>
References: <43556.213.228.140.150.1323560920.squirrel@webmail.decimal.pt>
 <20111213180707.GI11747@quack.suse.cz> <!&!AAAAAAAAAAAYAAAAAAAAAKCACr8ZwetPrGXZsycJodKihAAAEAAAAGPJDX4w3wxIo8Onu2+q/xMBAAAAAA==@decimal.pt>
 <20120102115222.GA3626@quack.suse.cz> <20120103010826.GF3626@quack.suse.cz>
 <20120103123841.GA31457@quack.suse.cz> <1325604356.2095.23.camel@falcor>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=z9cwe65w7vNx60fZBYp9MjZBP97+rdo0nrc65emDgIA=;
        b=SeqsZpPxveq6AXQjMeDRz8s+GwiTzHZPcIXlXYeyrTKjWbJpPWBR6WxKzD+FWnnBlw
         J8LoFcBAFXMcmC09gI9sQafuJflFZkI9ZYrDioy1cQjlCBGvthhBAFQ/BjNJSuOPIMKh
         OwSNSZy6fmDRG7T8Vkk7EEpRqL4d4/L+qTFYA=
In-Reply-To: <1325604356.2095.23.camel@falcor>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, haiyangz@microsoft.com, hjanssen@microsoft.com, "Rafael J. Wysocki" <rjw@sisk.pl>, James Morris <jmorris@namei.org>, Jorge Bastos <mysql.jorge@decimal.pt>, Mark Fasheh <mfasheh@suse.com>, Joel Becker <jlbec@evilplan.org>

On Tue, Jan 3, 2012 at 7:25 AM, Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
>
> Commit fb88c2b changed the security_old_inode_init_security() return
> code for S_PRIVATE inodes. As long as -EOPNOTSUPP is expected, probably
> should revert that as well.
>
> (I'm cc'ing the ocfs2 maintainers.)

Jan, Joel? Can you confirm? I was planning on doing 3.2 today, but
maybe I can't, or maybe we need to punt this to be a stable patch.

But maybe we can have quick testing and agreement? Does everybody
agree on both Honza's patch *and* revert of fb88c2b? Does the
EOPNOTSUPP return case match what we used to do?

                          Linus
