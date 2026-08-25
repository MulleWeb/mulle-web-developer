# mulle-web-developer Library Documentation for AI

## 1. Introduction & Purpose

**mulle-web-developer** provides development tools and utilities for the mulle-web ecosystem. It includes debugging utilities, development helpers, and tooling for building and testing web components.

This library is particularly useful for:
- Web development in mulle-web ecosystem
- Debugging web components
- Development tooling
- Testing utilities

## 2. Key Concepts & Design Philosophy

- **Developer Focused**: Tools for development, not production
- **Debugging Support**: Enhanced debugging capabilities
- **Utilities**: Common development tasks
- **Integration**: Works with mulle-web ecosystem

## 3. Core API & Data Structures

### Debugging

- `void web_debug_print_request(web_request_t *req)`
  - Pretty-print request for debugging

- `void web_debug_print_response(web_response_t *res)`
  - Pretty-print response for debugging

### Utilities

- `char *web_format_status_string(int status_code)`
  - Format HTTP status code to string

- `char *web_get_content_type(const char *extension)`
  - Get MIME type for file extension

## 4. Integration Examples

### Example 1: Debug Request
```c
web_request_t *req = web_request_new();
// ... configure request ...
web_debug_print_request(req);
```

### Example 2: MIME Type Lookup
```c
const char *mime_type = web_get_content_type("html");
// Returns "text/html"
```

## 5. Dependencies

- mulle-web core libraries
- Standard C library

## 6. Version Information

mulle-web-developer version macro: `MULLE_WEB_DEVELOPER_VERSION`
