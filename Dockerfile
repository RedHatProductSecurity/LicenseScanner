# Use the scancode-toolkit as the base image
FROM ghcr.io/redhatproductsecurity/licensescanner:scancode-base

# Set the maintainer label
LABEL maintainer="samwalke@redhat.com"

# Copy the scan script to the appropriate directory in the container
COPY scripts/scan.sh /usr/local/bin/scan.sh

# Ensure the scan script has execute permissions
RUN chmod +x /usr/local/bin/scan.sh

# Set the entry point to the scan script
ENTRYPOINT ["/usr/local/bin/scan.sh"]
