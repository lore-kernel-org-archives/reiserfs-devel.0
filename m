From: Viji V Nair <viji@fedoraproject.org>
Subject: Kernel packages with reiser4 support for Fedora 13 is now Available
Date: Mon, 18 Oct 2010 01:00:39 +0530
Message-ID: <AANLkTinstpomhf1bWwaTrSM7JJ6J78J6VwCNb5PpL0A6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=lBSAOMFEI5xmpU/eqQ0QjIi8ZUM5Ni9HMayqy58VF+k=;
        b=Jt6gXXw7/dpFXVDYHD6ZHaBHR+n0gyMwLSV1G0nZNSC1bhQIqrHHO7tLUsH3HNwyrL
         Zrwonf90CDPhoO/VBVmC26lWinERDdRtNkUdgWCmdIE/dybuJRfNUVqtsp8hDi9xa+1T
         tjQHD8KhPBj0SioWhafUEjUa8tCuxz00OL+zI=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi,


Uploaded kernel packages with reiser4 support for Fedora 13. Currently
it is available only for 64 bit platforms, will upload for the
remaining archs soon.

I am also working on "kmod-reiser4", this will help us to manage the
package more effectively and consistently.

Please test the same and report. The reiser4progs and libaal packages
are also available.

Download the packages from:

http://viji.fedorapeople.org/reiser4/F13/x86_64/


Thanks & Regards
Viji Nair
